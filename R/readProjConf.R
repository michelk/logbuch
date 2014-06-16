readProjConf <-
    function                            # ^ read project configuration in yaml
(
    f                                   # ^ file-path to yaml-file
)
{
    dd <-
        yaml.load_file(f)
    ddn <- names(dd)
    setNames(lapply(
        ddn,
        function(xn)
    {
        x <- dd[[xn]]
        switch(
            class(x)
            ,'list' =
                new('ProjConf',
                    name = xn, id = x$nb, sb = x$sb)
            , new('ProjConf', name = xn, id = x)
            )
    }
        ), ddn)
}                                  # ^ List with project-configuration
