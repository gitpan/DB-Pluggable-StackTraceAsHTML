
use strict;
use warnings;

 BEGIN { require 5.008; } 

use ExtUtils::MakeMaker 6.11;



my %WriteMakefileArgs = (
                       'test' => {
                                   'TESTS' => 't/*.t'
                                 },
                       'NAME' => 'DB::Pluggable::StackTraceAsHTML',
                       'DISTNAME' => 'DB-Pluggable-StackTraceAsHTML',
                       'CONFIGURE_REQUIRES' => {
                                                 'ExtUtils::MakeMaker' => '6.11'
                                               },
                       'AUTHOR' => 'Marcel Gruenauer <marcel@cpan.org>',
                       'BUILD_REQUIRES' => {},
                       'ABSTRACT' => 'Add debugger command to see stack trace as HTML',
                       'EXE_FILES' => [],
                       'VERSION' => '1.100850',
                       'PREREQ_PM' => {
                                        'Browser::Open' => '0',
                                        'Devel::StackTrace::WithLexicals' => '0',
                                        'Scalar::Util' => '0',
                                        'parent' => '0',
                                        'English' => '0',
                                        'Carp' => '0',
                                        'Test::More' => '0.88',
                                        'DB::Pluggable::Plugin' => '0',
                                        'File::Find' => '0',
                                        'Devel::StackTrace::AsHTML' => '0',
                                        'File::Temp' => '0',
                                        'File::Slurp' => '0'
                                      },
                       'LICENSE' => 'perl'
                     );


delete $WriteMakefileArgs{LICENSE}
  unless eval { ExtUtils::MakeMaker->VERSION(6.31) };

WriteMakefile(%WriteMakefileArgs);



