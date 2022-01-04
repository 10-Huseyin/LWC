public inherited sharing class AccountController {
    
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccounts(){
        List<Account> accounts = [
            SELECT Name, BillingState, Type, Phone
            FROM Account
        ];
        return accounts;
    }

    @AuraEnabled(cacheable=true)
    public static List<Account> getAccountByKeyword(
        String keyword
    ){
        if(String.isBlank(keyword)){
            //keyword == ''
            //keyword == null
            return new List<Account>();
        }
        String queryParameter = '%'+keyword+'%';
        List<Account> accounts = [
            SELECT Name, BillingState, Type, Phone
            FROM Account
            WHERE Name LIKE :queryParameter
        ];
        return accounts;
    }
     //Integer i = 10/0; we just typed to get error
     return accounts;
}


/*1.Create apex method => AccountController.getAccounts()
2.Use '@AuraEnabled' to expose the method to LWC
3.Create a LWC => lwcWire
4.Write an import to load the Apex Method definition/call => import getAccounts from '@salesforce/apex/AccountController.getAccounts';
5.Use @wire to invoke the Apex Method => @wire(getAccounts)
6.Store the result in a property => accounts
Note:*/
    //accounts.data => success in calling Apex; error=null
    //accounts.error => failure in calling apex; data=null





//@AuraEnabled ek açıklaması, 
//bir Apex denetleyici yöntemine istemci ve sunucu tarafı erişimi sağlar. (LWC)
//Bu ek açıklamayı sağlamak, yöntemlerinizi Lightning bileşenleriniz için 
//kullanılabilir hale getirir (hem Lightning web bileşenleri hem de Aura bileşenleri). 
//Yalnızca bu ek açıklamaya sahip yöntemler gösterilir. API sürüm 44.0 ve sonraki sürümlerde, 
//@AuraEnabled(cacheable=true) ek açıklamasını kullanarak yöntem sonuçlarını istemcide önbelleğe alarak 
//çalışma zamanı performansını iyileştirebilirsiniz. Yalnızca verileri alan ancak 
//değiştirmeyen yöntemler için yöntem sonuçlarını önbelleğe alabilirsiniz. 
//Bu açıklamayı kullanmak, Apex yöntemini çağıran her eylemde JavaScript kodunda 
//setStorable() öğesini çağırma ihtiyacını ortadan kaldırır.


// 1.Create apex method => AccountController.getAccounts()
// 2.Use '@AuraEnabled' to expose the method to LWC
// 3.Create a LWC => lwcWire
// 4.Write an import to load the Apex Method definition/call => import getAccounts from '@salesforce/apex/AccountController.getAccounts';
// 5.Use @wire to invoke the Apex Method => @wire(getAccounts)
// 6.Store the result in a property => accounts
// Note:
//     //accounts.data => success in calling Apex; error = null
//     //accounts.error => failure in calling apex; data=null (edited) 