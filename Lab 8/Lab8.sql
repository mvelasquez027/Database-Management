SELECT 
	People.name
FROM
	People, Director, Actor
WHERE
	People.pid = Director.pid AND
	People.pid = Actor.pid AND
	People.name = 'Sean Connery';