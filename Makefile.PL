use ExtUtils::MakeMaker;
WriteMakefile(
	      'NAME' => 'Date::Tolkien::Shire',
	      'VERSION_FROM' => 'Shire.pm',
	      PREREQ_PM => { 'Time::Local' => 0, },
	      );
