(use introspect)

(assert (equal? '(introspect) (introspect 'introspect)))
(assert (memq 'alist-ref (introspect 'data-structures)))
