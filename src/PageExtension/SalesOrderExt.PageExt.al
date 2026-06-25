pageextension 50203 "Sales Order Status Ext" extends "Sales Order"
{
    layout
    {
        addafter("Sell-to Customer Name")
        {
            field("Statut Client Commande"; StatutClientText)
            {
                ApplicationArea = All;
                Caption = 'Statut Client', Comment = 'FRA="Statut Client"';
                ToolTip = 'Affiche le statut commercial du client sélectionné.';
                Editable = false;
                StyleExpr = StatutClientStyle;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        MettreAJourStatutClient();
    end;

    trigger OnAfterGetCurrRecord()
    begin
        MettreAJourStatutClient();
    end;

    var
        StatutClientText: Text[50];
        StatutClientStyle: Text[20];

    local procedure MettreAJourStatutClient()
    var
        Customer: Record Customer;
    begin
        StatutClientText := '';
        StatutClientStyle := 'Standard';

        if Rec."Sell-to Customer No." <> '' then
            if Customer.Get(Rec."Sell-to Customer No.") then begin
                StatutClientText := Format(Customer."Statut Client");
                case Customer."Statut Client" of
                    Customer."Statut Client"::"Nouveau":
                        StatutClientStyle := 'Subordinate';
                    Customer."Statut Client"::"Actif":
                        StatutClientStyle := 'Favorable';
                    Customer."Statut Client"::"VIP":
                        StatutClientStyle := 'Strong';
                    Customer."Statut Client"::"Bloqué":
                        StatutClientStyle := 'Unfavorable';
                end;
            end;
    end;
}
