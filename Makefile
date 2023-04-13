# This Makefile is badly written at best
# TODO: Rewrite this Makefile to be more general


SRC = src/cat.c \
      src/true.c \
      src/false.c \
      src/yes.c \
      src/wc.c \
      src/unlink.c \
      src/rm.c \
      src/ls.c \
      src/linked_list.c \
      src/touch.c \
      src/whoami.c \
      src/pwd.c \
      src/base32.c \
      src/mkdir.c \
      src/mv.c \
      src/uname.c \
      src/id.c

ALL_BIN = cat \
	  true \
	  false \
	  yes \
	  wc \
	  unlink \
	  rm \
	  ls \
	  touch \
	  whoami \
	  pwd \
	  base32 \
	  mkdir \
	  mv \
          uname \
	  id

ECHO = @$(shell which echo)

OUT_DIR = bin
INSTALL_DIR = /bin

all: $(SRC) check_bin_dir $(ALL_BIN)
	@echo "Output dir: $(OUT_DIR)/"

check_bin_dir:
	@if test -d bin; then printf ""; else mkdir bin; fi

cat: src/cat.c check_bin_dir
	$(CC) src/cat.c $(CFLAGS) -o $(OUT_DIR)/cat

true: src/true.c check_bin_dir
	$(CC) src/true.c $(CFLAGS) -o $(OUT_DIR)/true

false: src/false.c check_bin_dir
	$(CC) src/false.c $(CFLAGS) -o $(OUT_DIR)/false

yes: src/yes.c check_bin_dir
	$(CC) src/yes.c $(CFLAGS) -o $(OUT_DIR)/yes

wc: src/wc.c check_bin_dir
	$(CC) src/wc.c $(CFLAGS) -o $(OUT_DIR)/wc

unlink: src/unlink.c check_bin_dir
	$(CC) src/unlink.c $(CFLAGS) -o $(OUT_DIR)/unlink

rm: src/rm.c check_bin_dir
	$(CC) src/rm.c $(CFLAGS) -o $(OUT_DIR)/rm

ls: src/ls.c check_bin_dir
	$(CC) src/ls.c src/linked_list.c $(CFLAGS) -lm -o $(OUT_DIR)/ls

touch: src/touch.c check_bin_dir
	$(CC) src/touch.c $(CLFAGS) -o $(OUT_DIR)/touch

whoami: src/whoami.c check_bin_dir
	$(CC) src/whoami.c $(CFLAGS) -o $(OUT_DIR)/whoami

pwd: src/pwd.c check_bin_dir
	$(CC) src/pwd.c $(CFLAGS) -o $(OUT_DIR)/pwd

base32: src/base32.c check_bin_dir
	$(CC) src/base32.c $(CFLAGS) -o $(OUT_DIR)/base32

mkdir: src/mkdir.c check_bin_dir
	$(CC) src/mkdir.c $(CFLAGS) -o $(OUT_DIR)/mkdir

mv: src/mv.c check_bin_dir
	$(CC) src/mv.c src/linked_list.c $(CFLAGS) -o $(OUT_DIR)/mv

#cp: src/cp.c check_bin_dir
#	$(CC) src/cp.c src/linked_list.c $(CFLAGS) -o $(OUT_DIR)/cp

uname: src/uname.c check_bin_dir
	$(CC) src/uname.c $(CFLAGS) -o $(OUT_DIR)/uname

id: src/id.c check_bin_dir
	$(CC) src/id.c $(CFLAGS) -o $(OUT_DIR)/id
.PHONY: clean install help

clean:
	ls -la
	rm -rf $(OUT_DIR)

install:
	cp $(OUT_DIR)/* $(INSTALL_DIR)
help:
	$(ECHO) -e "Targets:"
	$(ECHO) -e "\tcat"
	$(ECHO) -e "\tyes"
	$(ECHO) -e "\ttrue"
	$(ECHO) -e "\tfalse"
	$(ECHO) -e "\twc"
	$(ECHO) -e "\tunlink"
	$(ECHO) -e "\trm"
	$(ECHO) -e "\tls"
	$(ECHO) -e "\ttouch"
	$(ECHO) -e "\twhoami"
	$(ECHO) -e "\tpwd"
	$(ECHO) -e "\tbase32"
	$(ECHO) -e "\tmkdir"
	$(ECHO) -e "\tmv"
	$(ECHO) -e "\tcp"
