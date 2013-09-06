-module('problem_3').
-export([start/1, get_primes/1]).

% The prime factors of 13195 are 5, 7, 13 and 29.

% What is the largest prime factor of the number 600851475143 ?

start(N) ->
     getFactors(N).

getFactors(N) -> lists:max([X || X <- get_primes(round(math:sqrt(N))), div1(N, X)]).

div1(N, M) ->
    (N - trunc(N / M) * M) == 0.

% Sieve of Eratosthenes algorithm
get_primes(MaxNumber) ->
    Sieve = process_iteration(
        array:new([
            {size, MaxNumber - 1},
            {fixed, true},
            {default, true}
        ]),
        2,
        MaxNumber
    ),
    create_number_list(Sieve, 2, MaxNumber, []).

process_iteration(Sieve, not_found, _MaxNumber) -> Sieve;
process_iteration(Sieve, Current, MaxNumber) ->
    NewSieve = erase_multiple(
        Sieve,
        Current * Current,
        MaxNumber,
        Current
    ),
    process_iteration(
        NewSieve,
        find_next_prime(
            Sieve,
            Current + 1,
            MaxNumber
        ),
        MaxNumber
    ).

find_next_prime(_Sieve, Current, MaxNumber) when Current > MaxNumber -> not_found;
find_next_prime(Sieve, Current, MaxNumber) ->
    case array:get(Current - 2, Sieve) of
        true -> Current;
        false -> find_next_prime(Sieve, Current + 1, MaxNumber)
    end.

erase_multiple(Sieve, Current, MaxNumber, _Delta) when Current > MaxNumber -> Sieve;
erase_multiple(Sieve, Current, MaxNumber, Delta) ->
    erase_multiple(
        array:set(Current - 2, false, Sieve),
        Current + Delta,
        MaxNumber,
        Delta
    ).

create_number_list(_Sieve, Current, MaxNumber, Dest) when Current > MaxNumber ->
    lists:reverse(Dest);
create_number_list(Sieve, Current, MaxNumber, Dest) ->
    case array:get(Current - 2, Sieve) of
        true -> create_number_list(Sieve, Current + 1, MaxNumber, [Current] ++ Dest);
        false -> create_number_list(Sieve, Current + 1, MaxNumber, Dest)
    end.
