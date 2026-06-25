pageextension 50201 "Customer List Status Ext" extends "Customer List"
{
    layout
    {
        addafter("Name")
        {
            field("Statut Client"; Rec."Statut Client")
            {
                ApplicationArea = All;
                Caption = 'Statut Client', Comment = 'FRA="Statut Client"';
                ToolTip = 'Indique le statut commercial du client : Nouveau, Actif, VIP ou Bloqué.';
            }
        }
    }
}
