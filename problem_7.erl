-module('problem_7').
-export([start/1]).

% By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.

% What is the 10 001st prime number?

% @param {Integer} N - Nth prime.

start(N) ->
     get_primes(4000000, N).

div1(N, M) ->
    (N - trunc(N / M) * M) == 0.

% Sieve of Eratosthenes algorithm
get_primes(MaxNumber, N) ->
    Sieve = process_iteration(
        array:new([
            {size, MaxNumber - 1},
            {fixed, true},
            {default, true}
        ]),
        2,
        MaxNumber
    ),
    create_number_list(Sieve, 2, MaxNumber, [], N).

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

find_next_prime(_Sieve, Current, MaxNumber) when Current > MaxNumber-> not_found;
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

create_number_list(_Sieve, Current, MaxNumber, Dest, N) when (Current > MaxNumber)  or (length(Dest) >= N) ->
    lists:reverse(Dest);
create_number_list(Sieve, Current, MaxNumber, Dest, N) ->
    case array:get(Current - 2, Sieve) of
        true -> create_number_list(Sieve, Current + 1, MaxNumber, [Current] ++ Dest, N);
        false -> create_number_list(Sieve, Current + 1, MaxNumber, Dest, N)
    end.
