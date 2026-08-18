<!-- Page Content -->
<div class="container">

<div class="row">

    <!-- Blog Entries Column -->
    <div class="col-md-8">

      

        <!-- First Blog Post -->
        <?php 
            foreach($postagem as $destaque){
        ?>
        <div class="premium-card">
            <h1>
                <?php echo $destaque->titulo ?>
            </h1>
            <p class="lead">
                por <a href="<?php echo base_url('autor/'.$destaque->idautor.'/'.limpar($destaque->nome)) ?>"><?php echo $destaque->nome ?></a>
            </p>
            <p><span class="fa fa-clock-o"></span> <?php echo postadoem($destaque->data) ?></p>
            <hr>
            <p><i><?php echo $destaque->subtitulo ?></i></p>
            <?php
            if($destaque->img == 1) {
            $fotopub= base_url("assets/frontend/img/publicacao/" . md5($destaque->id) . ".jpg");
            ?>
            <img class="img-responsive" src="<?php echo $fotopub ?>" alt="">
            <?php
            }
            ?>
            <div class="post-content">
                <?php echo $destaque->conteudo ?>
            </div>
        </div>
        <?php
            }
        ?>

        
    </div>