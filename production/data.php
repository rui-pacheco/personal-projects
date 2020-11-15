 <div class="right_col" role="main">
  <div class="row">

    <div class="col-md-12 col-sm-12 col-xs-12 tile">
   <div class="x_content">

    <table id="datatable_humidade">
      <h3>Humidade</h3>
      <thead>
        <tr>
          <th>Id Sensor</th>
          <th>Data Medição</th>
          <th>Hora Medição</th>
          <th>Valor</th>
        </tr>
      </thead>
     <tbody id="humDinamica">
      
</div>

              
              <script type="text/javascript">

               $(document).ready(
                 function() {
                   setInterval(function() {
                     $('#humDinamica').load("getHumidade.php");
 });  //Delay here = 5 seconds 
});</script>

</div>
     </tbody>
    </table>
   </div>
 </div>

 </div>
</div>
<script type="text/javascript">$(document).ready( function () {
  $('#humDinamica').load("getHumidade.php");
    $('#datatable_humidade').DataTable({
      ordering:false,
      select:true,
      searching:false
    });
} );</script>