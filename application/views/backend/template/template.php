<div id="wrapper">

        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Navegação</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="<?php echo base_url('admin') ?>">Painel Administrativo</a>
            </div>
            <!-- /.navbar-header -->

            <ul class="nav navbar-top-links navbar-right">
                <li>
                    <button id="theme-toggle" class="theme-toggle-btn" aria-label="Alternar Tema" style="padding: 15px; background: transparent; border: none; font-size: 18px; outline: none;">
                        <i id="theme-icon" class="fa fa-moon-o"></i>
                    </button>
                </li>
            </ul>
            <!-- /.navbar-top-links -->

            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                        <li>
                            <a href="<?php echo base_url('admin/categoria')?>"><i class="fa fa-sitemap fa-fw"></i> Categorias</a>
                        </li>
                        <li>
                            <a href="<?php echo base_url('admin/publicacao')?>"><i class="fa fa-edit fa-fw"></i> Postagens</a>
                        </li>
                        <li>
                            <a href="<?php echo base_url('admin/usuarios')?>"><i class="fa fa-wrench fa-fw"></i> Usuários</a>
                        </li>
                        <li>
                            <a href="<?php echo base_url('admin/usuarios/logout')?>"><i class="fa fa-sign-out fa-fw"></i> Sair do Sistema</a>
                        </li>
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>