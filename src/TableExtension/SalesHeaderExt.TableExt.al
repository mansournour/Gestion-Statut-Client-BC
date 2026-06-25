tableextension 50201 "Sales Header Status Ext" extends "Sales Header"
{
    fields
    {
        modify("Sell-to Customer No.")
        {
            trigger OnAfterValidate()
            var
                Customer: Record Customer;
            begin
                if Rec."Sell-to Customer No." <> '' then begin
                    Customer.Get(Rec."Sell-to Customer No.");
                    VerifierStatutClient(Customer);
                end;
            end;
        }
    }

    local procedure VerifierStatutClient(Customer: Record Customer)
    var
        ErrClientBloqueDevis: Label 'Le client %1 (%2) est bloqué.\La création du devis est interdite.', Comment = 'FRA="Le client %1 (%2) est bloqué.\La création du devis est interdite."';
        ErrClientBloqueCommande: Label 'Le client %1 (%2) est bloqué.\La création de la commande est interdite.', Comment = 'FRA="Le client %1 (%2) est bloqué.\La création de la commande est interdite."';
    begin
        if Customer."Statut Client" = Customer."Statut Client"::"Bloqué" then begin
            case Rec."Document Type" of
                Rec."Document Type"::Quote:
                    Error(ErrClientBloqueDevis, Customer."No.", Customer.Name);
                Rec."Document Type"::Order:
                    Error(ErrClientBloqueCommande, Customer."No.", Customer.Name);
            end;
        end;
    end;
}
