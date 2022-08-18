namespace LCAPTestAug18;

using { E2EBJ_S4_PurchaseOrder } from '../srv/external/E2EBJ_S4_PurchaseOrder.cds';

using sap.workflow from './WorkflowObject';

using
{
    Country,
    Currency,
    Language,
    User,
    cuid,
    extensible,
    managed,
    temporal
}
from '@sap/cds/common';

entity comments
{
    key ID : UUID
        @Core.Computed;
    comments : String(100);
    rate : Integer;
    a_PurchaseOrder : Association to one E2EBJ_S4_PurchaseOrder.A_PurchaseOrder;
}

entity notes
{
    key ID : UUID
        @Core.Computed;
    note : String(100);
    rate : Integer;
    a_PurchaseOrder : Association to one E2EBJ_S4_PurchaseOrder.A_PurchaseOrder;
}

extend E2EBJ_S4_PurchaseOrder.A_PurchaseOrder
{
    comments : Association to one comments on comments.a_PurchaseOrder = $self;
    notes : Association to many notes on notes.a_PurchaseOrder = $self;
}
