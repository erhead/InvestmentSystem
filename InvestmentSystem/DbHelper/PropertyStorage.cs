using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DbHelper
{
    [AttributeUsage(AttributeTargets.Field)]
    class PropertyStorage : Attribute
    {
        public PropertyStorage(string fieldName)
        {
            FieldName = fieldName;
        }

        public string FieldName { get; set; }
    }
}
