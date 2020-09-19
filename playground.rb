input [which_runner][message_to_encrypt][write_encrypted]
input [which_runner][written_encrypted][decrypted][key][date]

runner ===> creates PROGRAM
COMMANDCENTER ====> creates ENIGMA
    COMMANDCENTER can write a string to a file
    COMMANDCENTER can read in ARGV
    COMMANDCENTER can figure out if it's an  encryption pattern
    COMMANDCENTER can figure out if it's a decryption pattern

ENIGMA ====> calls SHIFT and TRANSLATE
    ENIGMA can make random 5 digit number
    ENIGMA can figure out todays's date

SHIFT:calculates the shift
TRANSLATE:uses SHIFT to compose a new string

TRANSLATE: gives that info back to ENIGMA
