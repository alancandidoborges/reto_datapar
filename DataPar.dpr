program DataPar;

uses
  Vcl.Forms,
  unt.principal in 'views\unt.principal.pas' {frmPrincipal},
  unt.cliente in 'class\Model\unt.cliente.pas',
  unt.producto in 'class\Model\unt.producto.pas',
  unt.elementos.pedido in 'class\Model\unt.elementos.pedido.pas',
  unt.pedido in 'class\Model\unt.pedido.pas',
  unt.conexion in 'class\Conexion\unt.conexion.pas',
  unt.conexion.controller in 'class\Controller\unt.conexion.controller.pas',
  unt.cliente.dao in 'class\Dao\unt.cliente.dao.pas',
  unt.cliente.service in 'class\Service\unt.cliente.service.pas',
  unt.producto.dao in 'class\Dao\unt.producto.dao.pas',
  unt.elementos.pedido.dao in 'class\Dao\unt.elementos.pedido.dao.pas' {$R *.res},
  unt.formplantilharegistro.view in 'class\Views\PlantillaRegistro\unt.formplantilharegistro.view.pas' {frmPlantilhaRegistro},
  unt.TipoOperacion.Enum in 'class\Enum\unt.TipoOperacion.Enum.pas',
  unt.plantilha.consulta.view in 'class\Views\PlantilhaConsulta\unt.plantilha.consulta.view.pas' {frmPlantilhaConsulta},
  unt.registro.cliente.view in 'class\Views\RegistroClientes\unt.registro.cliente.view.pas' {frmRegistroCliente},
  unt.consulta.cliente.view in 'class\Views\PlanilhaConsultaCliente\unt.consulta.cliente.view.pas' {frmPlantilhaConsultaCliente},
  unt.producto.service in 'class\Service\unt.producto.service.pas',
  unt.plantilha.consulta.producto.view in 'class\Views\PlantilhaConsultaProducto\unt.plantilha.consulta.producto.view.pas' {frmPlantilhaConsultaProducto},
  unt.registro.producto.view in 'class\Views\CadastroProductos\unt.registro.producto.view.pas' {frmRegistroProducto},
  unt.vendas.view in 'class\Views\Vendas\unt.vendas.view.pas' {frmVendas},
  unt.inc.vendas in 'class\Views\Vendas\unt.inc.vendas.pas' {frmIncVendas},
  unt.itens.vendas in 'class\Views\Vendas\unt.itens.vendas.pas' {frmItensVendas},
  unt.elementos.pedido.service in 'class\Service\unt.elementos.pedido.service.pas',
  unt.pedido.dao in 'class\Dao\unt.pedido.dao.pas',
  unt.pedido.service in 'class\Service\unt.pedido.service.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmPlantilhaRegistro, frmPlantilhaRegistro);
  Application.CreateForm(TfrmPlantilhaConsulta, frmPlantilhaConsulta);
  Application.Run;
end.
