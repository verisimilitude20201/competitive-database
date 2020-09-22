SELECT 
    Teams.team_id,
    team_name,
    (
        SUM(IF(team_id = host_team AND host_goals > guest_goals, 3, 0))
                         +
        SUM(IF(team_id = guest_team AND guest_goals > host_goals, 3, 0))
                         +
        SUM(IF(team_id = guest_team AND guest_goals = host_goals, 1, 0))
                         +
        SUM(IF(team_id = host_team AND host_goals = guest_goals, 1, 0))
    
    ) AS num_points

FROM Teams
LEFT JOIN Matches ON (Teams.team_id = matches.host_team OR Teams.team_id = Matches.guest_team)
GROUP BY Teams.team_id
ORDER BY num_points DESC, Teams.team_id ASC


/*
Input Tables are per below

Teams table:
+-----------+--------------+
| team_id   | team_name    |
+-----------+--------------+
| 10        | Leetcode FC  |
| 20        | NewYork FC   |
| 30        | Atlanta FC   |
| 40        | Chicago FC   |
| 50        | Toronto FC   |
+-----------+--------------+

Matches table:
+------------+--------------+---------------+-------------+--------------+
| match_id   | host_team    | guest_team    | host_goals  | guest_goals  |
+------------+--------------+---------------+-------------+--------------+
| 1          | 10           | 20            | 3           | 0            |
| 2          | 30           | 10            | 2           | 2            |
| 3          | 10           | 50            | 5           | 1            |
| 4          | 20           | 30            | 1           | 0            |
| 5          | 50           | 30            | 1           | 0            |
+------------+--------------+---------------+-------------+--------------+


1. If we LEFT JOIN Matches ON (Teams.team_id = matches.host_team OR Teams.team_id = Matches.guest_team) we get a listing where except for the team_id 40, we would get matches table 
entries for all team_ids.

2. Now, we need to award 3 points to either host_team or guest_team depending upon who wins on the basis of number of goals.

    So host_goals > guest_goals OR guest_goals > host_goals.

  Similarly in case of a tie we award one point to both teams. This gives rise to 4 conditions.

  1. Current team_id can be host_team whose goals can be greater than guest goals.
  2. Current team_id can be guest_team whose goals can be greater than host goals.
  3. Current team id can be host team whose goals can be equal to guest.
  4. Current team_id can be guest team whose goals can be equal to host.

  We need to award appropriate points and SUM() them for all these conditions.

3. Below SUMs take care of these conditions.

SUM(IF(team_id = host_team AND host_goals > guest_goals, 3, 0))
                         +
SUM(IF(team_id = guest_team AND guest_goals > host_goals, 3, 0))
                    +
SUM(IF(team_id = guest_team AND guest_goals = host_goals, 1, 0))
                    +
SUM(IF(team_id = host_team AND host_goals = guest_goals, 1, 0))

*/