use ExtUtils::MakeMaker;
WriteMakefile(
	      'NAME' => 'Date::Tolkien::Shire',
	      'VERSION_FROM' => 'Shire.pm',
	      PREREQ_PM => {
		  'Time::Local'	=> 0,
		  'overload'	=> 0,
		  'strict'	=> 0,
		  'vars'	=> 0,
	      },
	  );
