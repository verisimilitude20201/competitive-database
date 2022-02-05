SELECT DISTINCT L1.account_id
FROM LogInfo L1
JOIN LogInfo L2 ON L1.account_id = L2.account_id AND L1.ip_address <> L2.ip_address AND (L2.login BETWEEN L1.login AND L1.logout ) 