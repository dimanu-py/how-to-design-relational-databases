SELECT user_id, type, balance FROM payments.accounts WHERE balance > 10000;

SELECT source_account_id, destination_account_id, amount FROM payments.account_transactions WHERE amount >= 500;

SELECT users.name, accounts.balance
FROM payments.accounts
JOIN users ON accounts.user_id = users.id
WHERE accounts.balance > 250000;

SELECT COUNT(*)
FROM payments.bank_transactions
WHERE account_id = 2 AND state = 'completed';

SELECT source_account_id, SUM(amount) AS total_transactions_amount
FROM payments.account_transactions
GROUP BY source_account_id;

SELECT type, balance
FROM payments.accounts
GROUP BY type;
