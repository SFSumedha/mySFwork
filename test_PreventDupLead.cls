@isTest
public class test_PreventDupLead {
    public static void testLeadDupe()
    {
        Lead myLead = new Lead (LastName = 'Test', Email = 'testLead@gmail.com',Company = 'TestL company');
        insert myLead; 
	    Lead myDupeLead = new Lead (LastName = 'Test data', Email = 'testLead@gmail.com',Company = 'TestL company');
        insert myDupeLead; 

		Test.startTest();
		myDupeLead.Email = myLead.Email;
		myDupeLead.mobilephone = myLead.mobilephone;
		Database.SaveResult result = Database.update(myDupeLead, false);
		System.assert(result.getErrors()[0].getMessage().contains('Duplicate Lead'));
		Test.stopTest();
    }
}