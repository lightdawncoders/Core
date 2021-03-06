﻿using System;
using System.Collections.Generic;
using System.Diagnostics.Tracing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Media;
using System.Xml.Serialization;

namespace Core.EventLogs
{
    public class Events
    {
        [XmlElement(Namespace = "http://schemas.microsoft.com/win/2004/08/events/event")]
        public List<LogEntry> Event { get; set; }
    }

    [XmlRoot(ElementName = "Event", Namespace = "http://schemas.microsoft.com/win/2004/08/events/event") XmlType("Event")]
    [XmlInclude(typeof(EventSourceInfo))]
    [XmlInclude(typeof(EventData))]
    public class LogEntry
    {
        public LogEntry()
        {
            System = new EventSourceInfo();
            EventData = new List<EventData>();
        }
        [XmlElement]
        public EventSourceInfo System { get; set; }

        [XmlArray("EventData"), XmlArrayItem(ElementName = "Data", Type = typeof(EventData))]
        public List<EventData> EventData { get; set; }

        public string Message { get { return EventData.Count > 0 ? EventData.Find(ev => ev.ParamName.Equals("message")).ParamValue : null; } }

        public string TraceKey { get { return EventData.Count > 0 ? EventData.Find(ev => ev.ParamName.Equals("traceKey")).ParamValue : null; } }


    }
    [XmlRoot(ElementName = "System") XmlType("System")]
    [XmlInclude(typeof(TimeCreated))]
    public class EventSourceInfo
    {
        [XmlElement]
        public int EventID { get; set; }

        [XmlElement(ElementName = "Level")]
        public int LevelNo { get; set; }

        string _levelText;
        public string LevelText
        {
            get
            {
                switch (LevelNo)
                {
                    case 1:
                        LevelIcon = "Images/error.png";
                        return _levelText= "Critical";
                    case 2:
                        LevelIcon = "Images/error.png";
                        return _levelText = "Error";
                    case 3:
                        LevelIcon = "Images/warning.png";
                        return _levelText = "Warning";
                    default:
                        LevelIcon = "Images/info.png";
                        return _levelText = "Informational";
                }
            }
            set {
                _levelText = value;
            }
        }
        Brush _color;
        public Brush Color {
            get
            {
                switch (LevelNo)
                {
                    case 1:
                        return _color = Brushes.DarkRed;
                    case 2:
                        return _color = Brushes.Red;
                    case 3:
                        return _color = Brushes.LightYellow;
                    default:
                        return _color = Brushes.SkyBlue;
                }
            }
            set {
                _color = value;
                
            }
            
        }

        public string LevelIcon { get; set; }

        [XmlElement]
        public int RecordID { get; set; }

        [XmlElement]
        public TimeCreated TimeCreated { get; set; }

    }

    [XmlRoot(ElementName = "TimeCreated")  XmlType("TimeCreated")]
    public class TimeCreated
    {
        private DateTime _systemTime;
        [XmlAttribute]
        public DateTime SystemTime
        {
            get { return _systemTime.ToLocalTime(); }

            set
            {

                _systemTime = value.ToLocalTime();
            }
        }

    }

    [XmlRoot(ElementName = "Data")  XmlType("Data")]
    public class EventData
    {
        [XmlAttribute("Name")]
        public string ParamName { get; set; }



        [XmlText]
        public string ParamValue;


    }
}
