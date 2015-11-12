(module introspect

(introspect)

(import chicken scheme data-structures)

(define (introspect #!optional mod)
  (if mod
      (let ((module-data (alist-ref mod ##sys#module-table)))
        (if module-data
            (let-values (((_ module-symbols _)
                          (##sys#module-exports module-data)))
              (map car module-symbols))
            (let loop ((syms (##sys#current-environment)))
              (if (null? syms)
                  '()
                  (let* ((sym/sym+prefix (car syms))
                         (sym+prefix (symbol->string (cdr sym/sym+prefix)))
                         (tokens (string-split sym+prefix "#" #t))
                         (prefix (car tokens)))
                    (if (equal? (->string mod) prefix)
                        (cons (string->symbol
                               (string-intersperse (cdr tokens) ""))
                              (loop (cdr syms)))
                        (loop (cdr syms))))))))
      (map car (##sys#current-environment))))
) ;; end module
