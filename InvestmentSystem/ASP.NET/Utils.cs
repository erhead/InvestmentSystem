using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace IIS.InvestmentSystem
{
    public static class Utils
    {
        public static decimal[] GetIndexes(Проект p)
        {
            var invest = p.НачальнаяИнвестиция;
            var CF = p.ЭлементДенежногоПотока;
            var rate = p.СтавкаДисконтирования / (decimal)100;
            var startDate = p.ДатаНачала;
            
            var indexes = new decimal[3];
            var npv = -invest;

            for (int i = 0; i < CF.Count; i++)
            {
                    var tmp = CF[i].Сумма / (decimal)Math.Pow((double)(1 + rate), (CF[i].Дата - startDate).TotalDays / 30);
                    npv = CF[i].Тип == ТипЭлементаДенежногоПотока.Приток ? npv + tmp : npv - tmp;
            }

            var forIrr = new List<ЭлементДенежногоПотока>();
            forIrr.Add(new ЭлементДенежногоПотока
            {
                Дата = p.ДатаНачала,
                Сумма = invest,
                Тип = ТипЭлементаДенежногоПотока.Отток
            });
            for (int i = 0; i < CF.Count; i++)
            {
                forIrr.Add(CF[i]);
            }

            indexes[0] = npv;
            indexes[1] = (decimal)computeIRR(forIrr, p.ДатаНачала);
            indexes[2] = (npv + invest) / invest;
            return indexes;
        }

        public static double computeIRR(List<ЭлементДенежногоПотока> cf, DateTime beginDate)
        {
            var oldNpv = 0.0;
            var newNpv = 0.0;
            var newRate = 0.01;
            var guessRate = 0.01;
            var lowGuessRate = 0.01;
            var highGuessRate = 1.0;

            for (var i = 0; i < 1000; i++)
            {
                decimal npv = 0;
                for (var j = 0; j < cf.Count; j++)
                {
                    var c = (cf[j].Сумма / (decimal)(Math.Pow((1 + guessRate), (cf[j].Дата - beginDate).TotalDays / 30)));
                    if (cf[j].Тип == ТипЭлементаДенежногоПотока.Отток)
                        c *= -1;
                    npv = npv + c;
                }

                if ((npv > 0) && (npv < (decimal)0.001))
                    break;
                oldNpv = oldNpv == 0 ? (double)npv : newNpv;
                newNpv = (double)npv;
                if (i > 0)
                {
                    if (oldNpv < newNpv)
                    {
                        if (oldNpv < 0 && newNpv < 0)
                            highGuessRate = newRate;
                        else
                            lowGuessRate = newRate;
                    }
                    else
                    {
                        if (oldNpv > 0 && newNpv > 0)
                            lowGuessRate = newRate;
                        else
                            highGuessRate = newRate;
                    }
                }
                guessRate = (lowGuessRate + highGuessRate) / 2;
                newRate = guessRate;
            }
            return guessRate;
        }
    }
}