(defmacro measure-time (&rest body)
  "Measure and return the running time of the code block."
  (declare (indent defun))
  (let ((start (make-symbol "start")))
    `(let ((,start (float-time)))
       ,@body
       (- (float-time) ,start))))

(require 'liberime)
;; darwin
(setq rime-data-dir "/Library/Input Methods/Squirrel.app/Contents/SharedSupport")
;; linux
(setq rime-data-dir "/usr/share/rime-data")
(require 'liberime-config)

(liberime-start rime-data-dir (expand-file-name "~/.emacs.d/test/rime"))
(liberime-get-schema-list)
(liberime-select-schema "luna_pinyin_simp")
(liberime-search "wode" nil)
(liberime-finalize)
(liberime-get-config "default.custom" "patch/menu/page_size" "int")
(liberime-set-config "default.custom" "patch/menu/page_size" 100 "int")
(liberime-sync-user-data)

(require 'pyim)
(setq pyim-default-scheme 'quanpin)
;; (setq pyim-default-scheme 'rime)
(set-input-method 'pyim)
