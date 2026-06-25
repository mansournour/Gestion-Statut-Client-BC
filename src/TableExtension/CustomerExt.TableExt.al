tableextension 50200 "Customer Status Ext" extends Customer
{
    fields
    {
        field(50200; "Statut Client"; Enum "Statut Client")
        {
            Caption = 'Statut Client', Comment = 'FRA="Statut Client"';
            DataClassification = CustomerContent;
        }
    }
}
