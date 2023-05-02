(module 
    (import "console" "log_string" (func $log_string (param i32 i32)))
    (import "console" "log" (func $log (param i32)))
    (import "js" "mem" (memory 1))

    (data (i32.const 0) "Hello, world!")
    
    (func $main (export "main")
        i32.const 0
        i32.const 13 ;; Length of string
        call $log_string ;; Prints "Hello, world!"

        f64.const 5
        call $factorial

        i32.trunc_f64_s ;; Converts f64 to i32, so that $log can print it.

        call $log
    )

    (func $factorial (param $n f64) (result f64)
        local.get $n
        f64.const 1
        f64.lt

        if (result f64)
            f64.const 1
        else
            ;; $n * factorial($n - 1)
            local.get $n

            local.get $n
            f64.const 1
            f64.sub

            call $factorial
            f64.mul
        end
    )
)