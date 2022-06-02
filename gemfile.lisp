# coding: utf-8

# coding: utf-8
(defvar ordinal (make-hash-table :test 'equal))

(defmacro hash (letter)
          `(gethash ,letter ordinal))

(setf (hash "א") 1
      (hash "ב") 2
      (hash "ג") 3
      (hash "ד") 4
      (hash "ה") 5
      (hash "ו") 6
      (hash "ז") 7 
      (hash "ח") 8
      (hash "ט") 9
      (hash "י") 10
      (hash "כ") 11
      (hash "ל") 12
      (hash "מ") 13
      (hash "נ") 14
      (hash "ס") 15
      (hash "ע") 16
      (hash "פ") 17
      (hash "צ") 18
      (hash "ק") 19
      (hash "ר") 20
      (hash "ש") 21
      (hash "ת") 22
      (hash "ך") 11
      (hash "ם") 13
      (hash "ן") 14
      (hash "ף") 17
      (hash "ץ") 18)

(defun ogc (word)
 "Counts the ordinal gematria of a single Hebrew word"
 (do ((start 0 (+ start 1))
      (end 1 (+ end 1))
      (gemnumber 0 (+ gemnumber (hash (subseq word start end)))))
((equal start (length word)) gemnumber)))

(defun file-increaser (word string ;&optional
                       )
"Two arguments. Creates or visits a file with the first string argument and appends the second string argument to the file"
           (with-open-file (str (make-pathname :name word) :direction :output
                                                             :if-exists :append
                                                             :if-does-not-exist :create)
             (format str string ;&optional
                     )))

(defun text-processor (text string ;&optional variables
                       )
  (if (> (length text) 1)
      (do ((start 0 (+ start 1))
           (end 1 (+ end 1)))
          ((member (subseq text start end) '(" " "," "." ":")) (progn (file-increaser (concatenate 'string (subseq text 0 end) ".html") ;string ;&optional variables
                                                                                      )
                                                                      (text-processor (remove (subseq text 0 end))))))
      'done))




             

             
             
