<div id="page-wrapper">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header"><?php echo 'Administrar ' . $subtitulo ?></h1>
        </div>
        <!-- /.col-lg-12   -->
    </div>
    <!-- /.row -->
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <?php echo 'Adicionar nova ' . $subtitulo ?>
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-lg-12">
                            <?php
                            echo validation_errors('<div class="alert alert-danger">', '</div>');
                            echo form_open('admin/publicacao/inserir');
                            ?>
                            <div class="form-group">
                                <label id="select-categoria">Categoria</label>
                                <select id="select-categoria" name="select-categoria" class="form-control">
                                    <?php foreach ($categorias as $categoria) { ?>
                                        <option value="<?php echo $categoria->id ?>"> <?php echo $categoria->titulo ?></option>
                                    <?php } ?>
                                </select>
                            </div>
                            <div class="form-group">
                                <label id="txt-titulo">Titulo</label>
                                <input type="text" id="txt-titulo" class="form-control" name="txt-titulo" placeholder="Digite o titulo ..." value="<?php echo set_value('txt-titulo') ?>">
                            </div>
                            <div class="form-group">
                                <label id="txt-subtitulo">Subtitulo</label>
                                <input type="text" id="txt-subtitulo" class="form-control" name="txt-subtitulo" placeholder="Digite o subtitulo ..." value="<?php echo set_value('txt-subtitulo') ?>">
                            </div>
                            <div class="form-group">
                                <label id="txt-conteudo">Conteudo</label>
                                <textarea name="txt-conteudo" id="txt-conteudo" class="form-control"><?php echo set_value('txt-conteudo') ?> </textarea>
                            </div>
                            <div class="form-group">
                                <label id="txt-data">Data</label>
                                <input type="datetime-local" id="txt-data" class="form-control" name="txt-data" placeholder="Digite o data.." value="<?php echo set_value('txt-data') ?>">
                            </div>
                            <input type="hidden" name="txt-usuario" id="txt-usuario" value="<?php echo $this->session->userdata('userlogado')->id; ?>">
                            <button type="submit" class="btn btn-default">Cadastrar</button>
                            <?php
                            echo form_close();
                            ?>
                        </div>
                    </div>
                    <!-- /.row (nested) -->
                </div>
                <!-- /.panel-body -->
            </div>
            <!-- /.panel -->
        </div>
        <!-- /.col-lg-6 -->
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <?php echo 'Alterar ' . $subtitulo . ' existente' ?>
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-lg-12">
                            <style>
                                img {
                                    width:200px;
                                }
                            </style>
                            <?php
                            $this->table->set_heading("Foto", "Titulo", "Data", "Alterar", "Excluir");
                            foreach ($publicacoes as $publicacao) {
                                $titulo = $publicacao->titulo;
                            
                                if($publicacao->img == 1) {
                                $fotopub= img("assets/frontend/img/publicacao/" . md5($publicacao->id) . ".jpg");
                                }else{
                                $fotopub= img("assets/frontend/img/semFoto2.png");
                                }
                                $data = postadoem($publicacao->data);

                                $alterar = anchor(base_url('admin/publicacao/alterar/' . md5($publicacao->id)), '<i class="fa fa-refresh fa-fw"></i>Alterar', 'class="btn btn-warning"');
                                $excluir = '<button type="button" class="btn btn-danger" data-toggle="modal" data-target=".excluir-modal-' . $publicacao->id . '"><i class="fa fa-remove fa-fw"></i> Excluir</button>';

                                echo $modal = ' <div class="modal fade excluir-modal-' . $publicacao->id . '" tabindex="-1" role="dialog" aria-hidden="true">
                                    <div class="modal-dialog modal-sm">
                                        <div class="modal-content">

                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span>
                                                </button>
                                                <h4 class="modal-title" id="myModalLabel2">Exclusão de Categoria</h4>
                                            </div>
                                            <div class="modal-body">
                                                <h4>Deseja Excluir a Publicacao ' . $publicacao->titulo . '?</h4>
                                                <p>Após Excluida a publicacao <b>' . $publicacao->titulo . '</b> não ficara mais disponível no Sistema.</p>
                                                <p>Todos os itens relacionados a categoria <b>' . $publicacao->titulo . '</b> serão afetados e não aparecerão no site até que sejam editados.</p>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                                                <a type="button" class="btn btn-primary" href="' . base_url("admin/publicacao/excluir/" . md5($publicacao->id)) . '">Excluir</a>
                                            </div>

                                        </div>
                                    </div>
                                </div>';
                                $this->table->add_row($fotopub, $titulo, $data, $alterar, $excluir);
                            }
                            $this->table->set_template(array(
                                'table_open' => '<table class="table table-striped">'
                            ));
                            echo $this->table->generate();
                            echo "<div class='paginacao'>".$links_paginacao."</div>";
                            ?>
                        </div>
                    </div>
                    <!-- /.row (nested) -->
                </div>
                <!-- /.panel-body -->
            </div>
            <!-- /.panel -->
        </div>
        <!-- /.col-lg-6 -->
    </div>
    <!-- /.row -->
</div>
<!-- 
<form role="form">
                                <div class="form-group">
                                    <label>Titulo</label>
                                    <input class="form-control" placeholder="Entre com o texto">
                                </div>
                                <div class="form-group">
                                    <label>Foto Destaque</label>
                                    <input type="file">
                                </div>
                                <div class="form-group">
                                    <label>Conteúdo</label>
                                    <textarea class="form-control" rows="3"></textarea>
                                </div>

                                <div class="form-group">
                                    <label>Selects</label>
                                    <select class="form-control">
                                        <option>1</option>
                                        <option>2</option>
                                        <option>3</option>
                                        <option>4</option>
                                        <option>5</option>
                                    </select>
                                </div>
                                <button type="submit" class="btn btn-default">Cadastrar</button>
                                <button type="reset" class="btn btn-default">Limpar</button>
                            </form> -->