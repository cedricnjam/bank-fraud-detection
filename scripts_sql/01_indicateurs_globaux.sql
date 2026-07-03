-- ==============================================================================
-- PROJET 1 : DÉTECTION DE FRAUDE BANCAIRE
-- OBJECTIF : Calculer les indicateurs globaux de la fraude pour le rapport d'activité
-- ==============================================================================

SELECT 
    COUNT(*) as total_transactions,
    SUM(Class) as total_fraudes,
    ROUND(AVG(Class) * 100, 4) as taux_fraude_pourcentage,
    ROUND(SUM(CASE WHEN Class = 1 THEN Amount ELSE 0 END), 2) as montant_total_fraude
FROM 
    transactions;