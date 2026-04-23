using {anubhav.db.master,anubhav.db.transaction  } from '../db/datamodel';
service CatalogueService @(path:'CatalogueService'){
    entity EmployeeSet as projection on master.employees;
    entity Addresset as projection on master.address;
    entity BusinessPartnerSet as projection on master.businesspartner;
    @odata.draft.enabled
    entity POS as projection on transaction.purchaseorder{
        *,
        Items,
        case OVERALL_STATUS
        when 'P' then 'Paid' 
        when 'A' then 'Approved'
        when 'X' then 'Rejected'
        when 'N' then 'New'
        end as OverallStatus: String(20),
        @UI.Hidden:true
         case OVERALL_STATUS
        when 'P' then 3 
        when 'A' then 3
        when 'X' then 1
        when 'N' then 2
        end as ColorCode: Integer,
    }
    actions {

  @Common.SideEffects: {
    TargetProperties: ['OverallStatus','ColorCode']
  }
  action setOrderProcessing();

  @Common.SideEffects: {
    TargetProperties: ['GROSS_AMOUNT']
  }
  action boost();

}
    // actions{
    //   @Common:{
    //     SideEffects:{
    //     $Type: 'Common.SideEffectsType',
    //     TargetProperties:[
    //       'in/GROSS_AMOUNT'
    //     ],

    //     },
    //   }
    //   action setOrderProcessing();
    //   action boost();
    // };
  //  To set default value
    function getOrderDefaults() returns POS;
    function getLargestOrder() returns POS;
    entity POItems as projection on transaction.poitems;

}
