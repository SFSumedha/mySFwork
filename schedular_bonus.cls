global class schedular_bonus implements Schedulable  {
    
    global void execute(SchedulableContext sc)
        
    {
        
        bonusBatchClass bBatch = new bonusBatchClass();
        database.executeBatch(bBatch);
    }

}