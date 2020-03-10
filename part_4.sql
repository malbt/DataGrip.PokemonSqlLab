 SELECT p.name      AS "Pokemon Name",                                             
       trainername AS "Trainer Name",                                              
       pokelevel   AS "Level",                                                     
       ty.name     AS "Primary Type",                                              
       tys.name    AS "Secondary Type"                                             
FROM pokemon.trainers AS t                                                         
       LEFT OUTER JOIN pokemon.pokemon_trainer as pt ON t.trainerID = pt.trainerID 
       LEFT OUTER JOIN pokemon.pokemons AS p ON p.id = pt.pokemon_id               
       LEFT OUTER JOIN pokemon.types AS ty ON p.primary_type = ty.id               
       LEFT OUTER JOIN pokemon.types AS tys ON p.secondary_type = tys.id           
        ORDER BY Level DESC;                                                       
