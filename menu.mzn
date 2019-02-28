int: menu_length;
int: money_limit;

array[1..menu_length] of int: menu_prices;
array[1..menu_length] of string: menu_names;

int: bound = money_limit div min(menu_prices);  
array[1..menu_length] of var 0..bound: order;

array[1..menu_length] of int: yumyum_factors;

/*constraint forall([order[i] >= 0 | i in 1..menu_length]);*/
constraint sum([order[i] * menu_prices[i] | i in 1..menu_length]) <= money_limit;

solve satisfy;
/*solve maximize sum([order[i] * yumyum_factors[i] | i in 1..menu_length]);*/

constraint assert(min(yumyum_factors) >= 0, "yumyum factor cannot be negative");
output [menu_names[i] ++ ": " ++ show(order[i]) ++ "\n" | i in 1..menu_length];

