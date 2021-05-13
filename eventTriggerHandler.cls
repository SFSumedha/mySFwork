public class eventTriggerHandler {

    public static void limitNoOfEvents(List<Event>eventList)
        
    {
        
   Integer monthNumber = Date.today().Month();
   Integer yearNumber  = Date.today().Year();
   Integer maxEvents  = 100;
       
        List<Event>eventListForThisMonth= [Select Id, CreatedById, CreatedDate from Event where CALENDAR_YEAR(CreatedDate)=:yearNumber
                                                   and CALENDAR_MONTH(CreatedDate)=:monthNumber and CreatedById =:UserInfo.getUserId()];
    
        If(eventListForThisMonth.Size()>maxEvents)
            eventList[0].addError('Too many Events created this month for user' +Event.CreatedById );
            
    
    }
    
}