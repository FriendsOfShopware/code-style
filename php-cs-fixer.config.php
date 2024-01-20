<?php

declare(strict_types=1);

$config = new PhpCsFixer\Config();
return $config
    ->setRiskyAllowed(true)
    ->setRules([
        '@PER-CS2.0' => true,
        '@PER-CS2.0:risky' => true,
        '@PHP81Migration' => true,
        '@PHP80Migration' => true,
        '@PHP80Migration:risky' => true,
    ]);
;
