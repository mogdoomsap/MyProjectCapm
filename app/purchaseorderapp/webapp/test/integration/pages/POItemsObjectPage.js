sap.ui.define(['sap/fe/test/ObjectPage'], function(ObjectPage) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ObjectPage(
        {
            appId: 'fioriapp.purchaseorderapp',
            componentId: 'POItemsObjectPage',
            contextPath: '/POS/Items'
        },
        CustomPageDefinitions
    );
});