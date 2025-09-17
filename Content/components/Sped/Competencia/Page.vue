<template>
	<div class="portlet light">
		<div class="portlet-title">
			<div class="caption collapsible" >
				<span class="caption-subject font-green-sharp bold uppercase">Competências</span>
			</div>
		</div>
		<div class="portlet-body form">
			<div class="widget-body">					
				<wes-mtreeview  id="meutreeview" 
								handle="0" 
								tabela="ED_COMPETENCIAS" 
								carga="SPED" style="padding: 0 0 0 0 !important;">
					
				</wes-mtreeview>
			</div>
		</div>
	</div>
</template>

<script>
export default {
}
</script>