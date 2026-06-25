enum 50200 "Statut Client"
{
    Extensible = true;
    Caption = 'Statut Client', Comment = 'FRA="Statut Client"';

    value(0; "Nouveau")
    {
        Caption = 'Nouveau', Comment = 'FRA="Nouveau"';
    }
    value(1; "Actif")
    {
        Caption = 'Actif', Comment = 'FRA="Actif"';
    }
    value(2; "VIP")
    {
        Caption = 'VIP', Comment = 'FRA="VIP"';
    }
    value(3; "Bloqué")
    {
        Caption = 'Bloqué', Comment = 'FRA="Bloqué"';
    }
}
