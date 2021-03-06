use 5.008;
use ExtUtils::MakeMaker;
use ExtUtils::Constant;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
    NAME              => 'Class::XS',
    VERSION_FROM      => 'lib/Class/XS.pm', # finds $VERSION
    PREREQ_PM         => {
      'ExtUtils::Constant' => '0',
    }, # e.g., Module::Name => 1.1
    LICENSE => 'perl',
    ($] >= 5.005 ?     ## Add these new keywords supported since 5.005
      (ABSTRACT_FROM  => 'lib/Class/XS.pm', # retrieve abstract from module
       AUTHOR         => 'Steffen Mueller <smueller@cpan.org>') : ()),
    LIBS              => [''], # e.g., '-lm'
    DEFINE            => '', # e.g., '-DHAVE_SOMETHING'
    INC               => '-I.', # e.g., '-I. -I/usr/include/other'
    CCFLAGS           => '-O2',
	# Un-comment this if you add C files to link with later:
    # OBJECT            => '$(O_FILES)', # link all the C files too
);

my @names;
push @names, { name => $_, type => 'IV', macro => 1 }
  foreach qw(ATTR_PRIVATE ATTR_PROTECTED ATTR_PUBLIC);
push @names, { qw(name CLASS_XS_DEBUG type IV) };

ExtUtils::Constant::WriteConstants(
  NAME => 'Class::XS',
  NAMES => \@names,
);

