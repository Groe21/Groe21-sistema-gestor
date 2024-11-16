<div class="container d-flex justify-content-center col-md-12">
    <form id="matricularEstudianteForm" action="<?php echo BASE_URL; ?>/models/estudiantes/matricular_estudiante.php" method="POST" enctype="multipart/form-data" class="col-md-12 p-4" style="border: 1px solid #ccc; background-color: #f9f9f9; border-radius: 8px;">
        
        <!-- Sección de Datos del Estudiante -->
        <div id="seccion-estudiante" class="card mb-4">
            <div class="card-header d-flex justify-content-between align-items-center">
                <h6 class="m-0 font-weight-bold text-primary">Datos del estudiante</h6>
                <div class="form-group ml-3">
                <div class="form-group">
                    <label for="id_periodo">Periodo Lectivo</label>
                    <?php echo $obtenerPeriodos->generarSelect(); ?>
                </div>
                </div>
                <div>
                <button type="button" class="btn btn-secondary btn-sm" onclick="abrirModal('estudiante')" style="background-color: #6c757d; border-color: #6c757d;">
                    <i class="fas fa-search"></i> Estudiante
                </button>
                </div>
                
            </div>
            <div class="card-body">
            <table class="table table-bordered">
                <tr>
                <td rowspan="7" style="text-align: center; width: 20%;">
                    <div class="form-group">
                    <label for="imagen">Foto</label>
                    <input type="file" class="form-control" id="imagen" name="imagen" required onchange="previewImage(event)">
                    <img id="preview" src="#" alt="Vista previa de la imagen" style="display: none; margin-top: 10px; max-width: 100%; border-radius: 50%;">
                    <button type="button" class="btn btn-primary btn-block mt-2" onclick="document.getElementById('imagen').click()">Agregar Foto</button>
                    </div>
                </td>
                <td>
                    <div class="form-group">
                    <label for="cedula_estudiante">Cédula</label>
                    <input type="text" class="form-control" id="cedula_estudiante" name="cedula_estudiante" required onblur="buscarPersona(this.value, 'estudiante')">
                    <input type="hidden" id="id_persona_estudiante" name="id_persona_estudiante">
                    </div>
                </td>
                <td>
                    <div class="form-group">
                    <label for="apellidos_estudiante">Apellidos</label>
                    <input type="text" class="form-control" id="apellidos_estudiante" name="apellidos_estudiante" required>
                    </div>
                </td>
                </tr>
                <tr>
                <td>
                    <div class="form-group">
                    <label for="nombres_estudiante">Nombres</label>
                    <input type="text" class="form-control" id="nombres_estudiante" name="nombres_estudiante" required>
                    </div>
                </td>
                <td>
                    <div class="form-group">
                    <label for="lugar_nacimiento_estudiante">Lugar de Nacimiento</label>
                    <input type="text" class="form-control" id="lugar_nacimiento_estudiante" name="lugar_nacimiento_estudiante" required>
                    </div>
                </td>
                </tr>
                <tr>
                <td>
                    <div class="form-group">
                    <label for="residencia_estudiante">Residencia</label>
                    <input type="text" class="form-control" id="residencia_estudiante" name="residencia_estudiante" required>
                    </div>
                </td>
                <td>
                    <div class="form-group">
                    <label for="direccion_estudiante">Dirección</label>
                    <input type="text" class="form-control" id="direccion_estudiante" name="direccion_estudiante" required>
                    </div>
                </td>
                </tr>
                <tr>
                <td>
                    <div class="form-group">
                    <label for="sector_estudiante">Sector</label>
                    <input type="text" class="form-control" id="sector_estudiante" name="sector_estudiante" required>
                    </div>
                </td>
                <td>
                    <div class="form-group">
                    <label for="fecha_nacimiento_estudiante">Fecha de Nacimiento</label>
                    <input type="date" class="form-control" id="fecha_nacimiento_estudiante" name="fecha_nacimiento_estudiante" required>
                    </div>
                </td>
                </tr>
                <tr>
                <td>
                <div class="form-group">
                    <label for="id_paralelo_estudiante">Paralelo</label>
                    <?php echo $obtenerParalelos->generarSelect(); ?>
                </div>
                </td>
                <td>
                    <div class="form-group">
                    <label for="codigo_unico_estudiante">Código Único</label>
                    <input type="text" class="form-control" id="codigo_unico_estudiante" name="codigo_unico_estudiante" required>
                    </div>
                </td>
                </tr>
                <tr>
                <td>
                    <div class="form-group">
                    <label for="condicion_estudiante">Condición</label>
                    <select class="form-control" id="condicion_estudiante" name="condicion_estudiante" required onchange="toggleDiscapacidad(this.value)">
                    <option value="" selected disabled>Seleccionar</option>
                    <option value="1">Con Discapacidad</option>
                    <option value="0">Sin Discapacidad</option>
                    </select>
                    </div>
                </td>
                <td>
                    <div class="form-group">
                    <label for="tipo_discapacidad">Tipo de Discapacidad</label>
                    <input type="text" class="form-control" id="tipo_discapacidad" name="tipo_discapacidad" disabled>
                    </div>
                </td>
                </tr>
                <tr>
                <td>
                    <div class="form-group">
                    <label for="porcentaje_discapacidad">Porcentaje de Discapacidad</label>
                    <input type="text" class="form-control" id="porcentaje_discapacidad" name="porcentaje_discapacidad" disabled>
                    </div>
                </td>
                <td>
                    <div class="form-group">
                    <label for="carnet_discapacidad">N° Carnet de Discapacidad</label>
                    <input type="text" class="form-control" id="carnet_discapacidad" name="carnet_discapacidad" disabled>
                    </div>
                </td>
                </tr>
            </table>
            </div>
        </div>

        <!-- Sección de Datos de la Madre -->
        <div id="seccion-mama" class="card mb-4">
            <div class="card-header d-flex justify-content-between align-items-center">
            <h6 class="m-0 font-weight-bold text-primary">Datos de la Madre</h6>
            <button type="button" class="btn btn-secondary btn-sm" onclick="abrirModal('madre')" style="background-color: #6c757d; border-color: #6c757d;">
                <i class="fas fa-search"></i> Madre
            </button>
            </div>
            <div class="card-body">
            <table class="table table-bordered">
                <tr>

                <td>
                    <div class="form-group">
                    <label for="cedula_mama">Cédula de la Madre</label>
                    <input type="text" class="form-control" id="cedula_mama" name="cedula_mama" required onblur="buscarPersona(this.value, 'madre')">
                    <input type="hidden" id="id_persona_mama" name="id_persona_mama">
                    </div>
                </td>
                <td>
                    <div class="form-group">
                    <label for="apellidos_nombres_mama">Apellidos y Nombres de la Madre</label>
                    <input type="text" class="form-control" id="apellidos_nombres_mama" name="apellidos_nombres_mama" required>
                    </div>
                </td>
                </tr>
                <tr>
                <td>
                    <div class="form-group">
                    <label for="direccion_mama">Dirección de la Madre</label>
                    <input type="text" class="form-control" id="direccion_mama" name="direccion_mama" required>
                    </div>
                </td>
                <td>
                    <div class="form-group">
                    <label for="ocupacion_mama">Ocupación de la Madre</label>
                    <input type="text" class="form-control" id="ocupacion_mama" name="ocupacion_mama" required>
                    </div>
                </td>
                </tr>
                <tr>
                <td>
                    <div class="form-group">
                    <label for="telefono_mama">Teléfono de la Madre</label>
                    <input type="text" class="form-control" id="telefono_mama" name="telefono_mama" required>
                    </div>
                </td>
                <td>
                    <div class="form-group">
                    <label for="correo_mama">Correo de la Madre</label>
                    <input type="email" class="form-control" id="correo_mama" name="correo_mama" required>
                    </div>
                </td>
                </tr>
            </table>
            </div>
        </div>

        <!-- Sección de Datos del Padre -->
        <div id="seccion-papa" class="card mb-4">
            <div class="card-header d-flex justify-content-between align-items-center">
            <h6 class="m-0 font-weight-bold text-primary">Datos del Padre</h6>
            <button type="button" class="btn btn-secondary btn-sm" onclick="abrirModal('padre')" style="background-color: #6c757d; border-color: #6c757d;">
                <i class="fas fa-search"></i> Padre
            </button>
            </div>
            <div class="card-body">
            <table class="table table-bordered">
                <tr>
                <td>
                    <div class="form-group">
                    <label for="cedula_papa">Cédula del Padre</label>
                    <input type="text" class="form-control" id="cedula_papa" name="cedula_papa" required onblur="buscarPersona(this.value, 'padre')">
                    <input type="hidden" id="id_persona_papa" name="id_persona_papa">
                    </div>
                </td>
                <td>
                    <div class="form-group">
                    <label for="apellidos_nombres_papa">Apellidos y Nombres del Padre</label>
                    <input type="text" class="form-control" id="apellidos_nombres_papa" name="apellidos_nombres_papa" required>
                    </div>
                </td>
                </tr>
                <tr>
                <td>
                    <div class="form-group">
                    <label for="direccion_papa">Dirección del Padre</label>
                    <input type="text" class="form-control" id="direccion_papa" name="direccion_papa" required>
                    </div>
                </td>
                <td>
                    <div class="form-group">
                    <label for="ocupacion_papa">Ocupación del Padre</label>
                    <input type="text" class="form-control" id="ocupacion_papa" name="ocupacion_papa" required>
                    </div>
                </td>
                </tr>
                <tr>
                <td>
                    <div class="form-group">
                    <label for="telefono_papa">Teléfono del Padre</label>
                    <input type="text" class="form-control" id="telefono_papa" name="telefono_papa" required>
                    </div>
                </td>
                <td>
                    <div class="form-group">
                    <label for="correo_papa">Correo del Padre</label>
                    <input type="email" class="form-control" id="correo_papa" name="correo_papa" required>
                    </div>
                </td>
                </tr>
            </table>
            </div>
        </div>

        <button type="submit" class="btn btn-primary">Matricular Estudiante</button>
    </form>
</div>