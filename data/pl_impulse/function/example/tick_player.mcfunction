#> pl_impulse:example/tick_player
# tick function

## Check player's input.
    execute if predicate {condition:"entity_properties",entity:"this",predicate:{type_specific:{type:"player",input:{jump:true}}}} run function pl_impulse:example/impulse
    execute if entity @s[tag=pl_impulse_ex_sub] unless predicate {condition:"entity_properties",entity:"this",predicate:{type_specific:{type:"player",input:{jump:true}}}} run function pl_impulse:example/cancel