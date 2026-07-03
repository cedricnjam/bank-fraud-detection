-- ==============================================================================
-- PROJET 1 : DÉTECTION DE FRAUDE BANCAIRE
-- OBJECTIF : Segmenter les fraudes par tranches de montants (Analyse comportementale)
-- ==============================================================================

SELECT 
    CASE 
        WHEN Amount <= 10 THEN '01. Petits montants (<= 10€)'
        WHEN Amount > 10 AND Amount <= 100 THEN '02. Montants moyens (10€ - 100€)'
        WHEN Amount > 100 AND Amount <= 1000 THEN '03. Grands montants (100€ - 1000€)'
        ELSE '04. Montants critiques (> 1000€)'
    END as tranche_montant,
    COUNT(*) as total_transactions,
    SUM(Class) as total_fraudes,
    ROUND(SUM(CASE WHEN Class = 1 THEN Amount ELSE 0 END), 2) as montant_total_fraude
FROM 
    transactions
GROUP BY 
    tranche_montant
ORDER BY 
    tranche_montant;