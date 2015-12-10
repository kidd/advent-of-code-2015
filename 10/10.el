(defun aaa (x)
  (let  ((l (match-string 0)))
    (format "%s%s" (length l) (substring l 0 1))))

(defun look-and-say (num)
  (let ((b (generate-new-buffer "t")))
    (with-current-buffer b
      (insert num))
    (map-regex b "\\(\.\\)\\1*"
               #'aaa)))


(defun list-to-string (l)
  (mapconcat 'identity l ""))

(defun my-l-a-s (num its)
  (if ( = its 0)
      num
    (my-l-a-s (list-to-string
               (look-and-say num))
              (- its 1))))

(defun map-regex (buffer regex fn)
  "Map the REGEX over the BUFFER executing FN.

   FN is called with the match-data of the regex.

   Returns the results of the FN as a list."
  (with-current-buffer buffer
    (save-excursion
      (goto-char (point-min))
      (let (res)
        (save-match-data
          (while (re-search-forward regex nil t)
            (let ((f (match-data)))
              (setq res
                    (append res
                            (list
                             (save-match-data
                               (funcall fn f))))))))
        res))))

(length (my-l-a-s  "3113322113" 40))
(my-l-a-s  "111221" 5)
