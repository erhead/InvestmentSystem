using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DbHelper
{
    [AttributeUsage(AttributeTargets.Class)]
    class EntityStorage : Attribute
    {
        public EntityStorage(string tableName)
        {
            TableName = tableName;
        }

        public string TableName { get; set; }
    }
}
