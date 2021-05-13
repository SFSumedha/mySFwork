global class bonusBatchClass implements Database.Batchable<SObject>{

    list<Bonus__c>bonusList = new list<Bonus__c>();
    
    global Database.QueryLocator start(Database.BatchableContext BC)
    {
        //String query= 'SELECT Id, Name, Start_Date__c, End_Date__c FROM Bonus__c WHERE Start_Date__c=TODAY LIMIT 1000';
       
        return Database.getQueryLocator([SELECT Id, Name, Start_Date__c, End_Date__c FROM Bonus__c WHERE Start_Date__c=TODAY]) ;
        
    }
    
    global void execute(Database.BatchableContext BC, list<Bonus__c>bonusList)
    {
        
          //To create Bonus Payout records
        list<Bonus_Payouts__c>bonusPayoutList = new list<Bonus_Payouts__c>();
        for(Bonus__c b :bonusList)
        {
           Bonus_Payouts__c bPayouts = new  Bonus_Payouts__c();
           bPayouts.Name    = b.Name + '';
           bPayouts.Date__c = Date.today();
           bPayouts.Bonus__c= b.Id;
           bonusPayoutList.add(bPayouts);     
        }
       insert bonusPayoutList;
        
    }
    global void finish(Database.BatchableContext BC)
    {
        
    }
    
}