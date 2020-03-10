# part 3                                                                                                           
#  What is each pokemon's primary type?                                                                            
                                                                                                                   
SELECT pokemons.name, types.name                                                                                   
FROM pokemon.pokemons,                                                                                             
     pokemon.types                                                                                                 
WHERE pokemons.primary_type = types.id;                                                                            
                                                                                                                   
#  What is Rufflet's secondary type?                                                                               
                                                                                                                   
SELECT pokemons.name, types.name                                                                                   
 FROM pokemon.pokemons,                                                                                            
      pokemon.types                                                                                                
WHERE pokemons.secondary_type = types.id                                                                           
  AND pokemons.name = "Rufflet";                                                                                   
                                                                                                                   
                                                                                                                   
# What are the names of the pokemon that belong to the trainer with trainerID 303?                                 
                                                                                                                   
SELECT pokemons.name                                                                                               
FROM pokemon.pokemons,                                                                                             
     pokemon.pokemon_trainer,                                                                                      
     pokemon.trainers                                                                                              
WHERE pokemons.id = pokemon_trainer.pokemon_id                                                                     
  AND pokemon_trainer.trainerID = trainers.trainerID                                                               
  AND trainers.trainerID = 303;                                                                                    
                                                                                                                   
# How many pokemon have a secondary type Poison                                                                    
                                                                                                                   
SELECT COUNT(pokemons.name)                                                                                        
FROM pokemon.pokemons,                                                                                             
     pokemon.types                                                                                                 
WHERE pokemons.secondary_type = types.id                                                                           
  AND types.name = "Poison";                                                                                       
                                                                                                                   
# What are all the primary types and how many pokemon have that type?                                              
                                                                                                                   
SELECT types.name, COUNT(pokemons.name)                                                                            
FROM pokemon.pokemons,                                                                                             
     pokemon.types                                                                                                 
WHERE pokemons.primary_type = types.id                                                                             
GROUP BY types.name;                                                                                               
                                                                                                                   
                                                                                                                   
# How many pokemon at level 100 does each trainer with at least one level 100 pokemone have?                       
# (Hint: your query should not display a trainer                                                                   
                                                                                                                   
SELECT pokemon_trainer.trainerID, COUNT(*)                                                                         
FROM pokemon.pokemon_trainer                                                                                       
WHERE pokemon_trainer.pokelevel = 100                                                                              
GROUP BY pokemon_trainer.trainerID;                                                                                
                                                                                                                   
#  How many pokemon only belong to one trainer and no other?                                                       
                                                                                                                   
SELECT COUNT(*)                                                                                                    
FROM (SELECT COUNT(pokemon.pokemon_trainer.pokemon_id)                                                             
      FROM pokemon.pokemon_trainer                                                                                 
      GROUP BY pokemon_id                                                                                          
      HAVING COUNT(*) = 1) As only_one;                                                                                   
                                
