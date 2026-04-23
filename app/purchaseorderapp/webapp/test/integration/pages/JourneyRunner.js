sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"fioriapp/purchaseorderapp/test/integration/pages/POSList",
	"fioriapp/purchaseorderapp/test/integration/pages/POSObjectPage",
	"fioriapp/purchaseorderapp/test/integration/pages/POItemsObjectPage"
], function (JourneyRunner, POSList, POSObjectPage, POItemsObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('fioriapp/purchaseorderapp') + '/test/flp.html#app-preview',
        pages: {
			onThePOSList: POSList,
			onThePOSObjectPage: POSObjectPage,
			onThePOItemsObjectPage: POItemsObjectPage
        },
        async: true
    });

    return runner;
});

