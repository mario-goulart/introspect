(cond-expand
  (chicken-4
   (use introspect)
   (assert (memq 'alist-ref (introspect 'data-structures))))
  (chicken-5
   (import introspect)
   (assert (memq 'string-append (introspect 'scheme))))
  (else
   (error "Unsupported CHICKEN version.")))

(assert (equal? '(introspect) (introspect 'introspect)))
