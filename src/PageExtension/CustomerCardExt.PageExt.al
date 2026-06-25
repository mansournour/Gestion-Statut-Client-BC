pageextension 50200 "Customer Card Status Ext" extends "Customer Card"
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
