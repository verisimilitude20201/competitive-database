SELECT id, 
    SUM(CASE When month="Jan" Then revenue else null END) AS Jan_Revenue,
    SUM(CASE When month="Feb" Then revenue else null END) AS Feb_Revenue,
    SUM(CASE When month="Mar" Then revenue else null END) AS Mar_Revenue,
    SUM(CASE When month="Apr" Then revenue else null END) AS Apr_Revenue,
    SUM(CASE When month="May" Then revenue else null END) AS May_Revenue,
    SUM(CASE When month="Jun" Then revenue else null END) AS Jun_Revenue,
    SUM(CASE When month="Jul" Then revenue else null END) AS Jul_Revenue,
    SUM(CASE When month="Aug" Then revenue else null END) AS Aug_Revenue,
    SUM(CASE When month="Sep" Then revenue else null END) AS Sep_Revenue,
    SUM(CASE When month="Oct" Then revenue else null END) AS Oct_Revenue,
    SUM(CASE When month="Nov" Then revenue else null END) AS Nov_Revenue,
    SUM(CASE When month="Dec" Then revenue else null END) AS Dec_Revenue
FROM Department
GROUP BY id
ORDER BY id;