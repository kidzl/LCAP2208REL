using { E2EBJ_S4_PurchaseOrder } from './external/E2EBJ_S4_PurchaseOrder.cds';

using { LCAPTestAug18 as my } from '../db/schema';

@path : 'service/LCAPTestAug18'
service LCAPTestAug18Service
{
    entity A_PurchaseOrder as
        projection on E2EBJ_S4_PurchaseOrder.A_PurchaseOrder
        {
            *
        };

    entity comments as
        projection on my.comments
        {
            *
        };

    entity notes as
        projection on my.notes
        {
            *
        };
}

annotate LCAPTestAug18Service with @requires :
[
    'authenticated-user'
];
