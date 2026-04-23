using CatalogueService as service from '../../srv/CatalogueService';

annotate service.POS with @(
    Common.DefaultValuesFunction: 'getOrderDefaults',
    UI.HeaderInfo:{
        TypeName:'POS',
      TypeNamePlural:'PurchaseOrder',
      Title:{Value: PO_ID},
      Description:{Value:PARTNER_GUID.COMPANY_NAME},
      ImageUrl:'https://www.bing.com/images/search?view=detailV2&ccid=7wxNSECS&id=6FBBE4C7247FAB327D29AF1C2FAAECEB03750CD1&thid=OIP.7wxNSECSpgbqistCob1vmQHaEy&mediaurl=https%3a%2f%2fmaxst.icons8.com%2fvue-static%2flandings%2fpage-index%2fproducts%2fpreview%2flink-preview%2fouch%2fouch1.png&exph=440&expw=680&q=url%3ahttps%3a%2f%2ficons8.com%2f&FORM=IRPRST&ck=BEB95787BF77C83B3985F4BCC3C22F9E&selectedIndex=37&itb=0'
    },

 UI.SelectionFields: [
    PO_ID,
    PARTNER_GUID.COMPANY_NAME,
    PARTNER_GUID.ADDRESS_GUID.COUNTRY,
    GROSS_AMOUNT,
    OVERALL_STATUS

 ],
 UI.LineItem: [
          {
              $Type : 'UI.DataField',
              Value : PO_ID,
          },
          {
              $Type : 'UI.DataField',
              Value : PARTNER_GUID.COMPANY_NAME,
          },
          {
              $Type : 'UI.DataField',
              Value : PARTNER_GUID.ADDRESS_GUID.COUNTRY,
          },
          {
              $Type : 'UI.DataField',
              Value : GROSS_AMOUNT,
          },
          {
              $Type : 'UI.DataFieldForAction',
              Action : 'CatalogueService.boost',
              Label:'boost',
              Inline:true
          },
          {
              $Type : 'UI.DataField',
              Value : OverallStatus,
              Criticality: ColorCode
          },
          {
              $Type : 'UI.DataFieldForAction',
              Action : 'CatalogueService.setOrderProcessing',
              Label : 'Set Order Status',
              Inline : false
          },
 ],
 UI.Facets:[
   {
       $Type : 'UI.CollectionFacet',
       Label: 'PO Information',
       Facets:[
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'More Information',
            Target : '@UI.Identification', 
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label: 'Prices',
            Target : '@UI.FieldGroup#prices',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label:'Status',
            Target : '@UI.FieldGroup#Status',
        },
       ],
   },
   {
       $Type : 'UI.ReferenceFacet',
       Target : 'Items/@UI.LineItem',
       Label:'PO Items'
   },

 ],
 UI.Identification:[
      {
          $Type : 'UI.DataField',
          Value : PO_ID,
      },
      {
          $Type : 'UI.DataField',
          Value : PARTNER_GUID_NODE_KEY,
          Label:'Partner ID'
      },
      {
          $Type : 'UI.DataField',
          Value : LIFECYCLE_STATUS,
          Label: 'Lifecycle Status'
      },
 ],
 
UI.FieldGroup#prices:{
    Label: 'Prices',
    Data:[
        {
            $Type : 'UI.DataField',
            Value : GROSS_AMOUNT,
        },
        {
            $Type : 'UI.DataField',
            Value : NET_AMOUNT,
        },
      {
          $Type : 'UI.DataField',
          Value : TAX_AMOUNT,
      },
    ]
 },
 UI.FieldGroup#Status:{
    Label: 'Status',
    Data:[
        {
            $Type : 'UI.DataField',
            Value : CURRENCY_code,
        },
        {
            $Type : 'UI.DataField',
            Value : OVERALL_STATUS,
        },
    
    ]
 },

);

annotate service.POItems with @(
  UI.LineItem: [
    {
        $Type : 'UI.DataField',
        Value : PO_ITEM_POS,
    },
    {
        $Type : 'UI.DataField',
        Value : PRODUCT_GUID_NODE_KEY,
    },
    {
        $Type : 'UI.DataField',
        Value : PRODUCT_GUID_DESCRIPTION,
    },
    {
        $Type : 'UI.DataField',
        Value : GROSS_AMOUNT,
    },
    {
        $Type : 'UI.DataField',
        Value : CURRENCY_code,
    },
  ],
UI.Facets:[{
    $Type : 'UI.ReferenceFacet',
    Target : '@UI.Identification',
    Label:'More Information'
},

],
UI.Identification:[
    {
        $Type : 'UI.DataField',
        Value : CURRENCY_code,
    },
    {
        $Type : 'UI.DataField',
        Value : GROSS_AMOUNT,
    },
    {
        $Type : 'UI.DataField',
        Value : NET_AMOUNT,
    },
    {
        $Type : 'UI.DataField',
        Value : NODE_KEY,
        Label : 'Node KeyValue',
    },
    // {
    //     $Type : 'UI.DataField',
    //     Value : PARENT_KEY_NODE_KEY,
    //     Label : 'Parent KeyValue',
    // },
    {
        $Type : 'UI.DataField',
        Value : PO_ITEM_POS,
        Label : 'PO_ITEM_POS',
    },
    {
        $Type : 'UI.DataField',
        Value : PARENT_KEY_NODE_KEY,
        Label : 'PARENT_KEY_NODE_KEY',
    },
]
);

@cds.odata.valuelist
annotate CatalogueService.BusinessPartnerSet with @(
    UI.Identification:[
        {
            $Type : 'UI.DataField',
            Value : COMPANY_NAME,
        },
    ]
) ;

// annotate service.POItems with {
//     PRODUCT_GUID_DESCRIPTION @Common.Label : 'Desc';
//     DESCRIPTION @Common.Label : 'Desc';
// };
// annotate service.POS with @{
//     PARTNER_GUID@(
//     Common.Valuelist.entity:'CatalogueService.BusinessPartnerSet',
//     Common.Text:PARTNER_GUID.COMPANY_NAME
//     )
// };




// annotate service.POS with{
//     @Common.FilterDefaultValue :'100000001'
//     PO_ID
// };