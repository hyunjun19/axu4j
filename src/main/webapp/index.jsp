<%@ page contentType="text/html; charset=UTF-8"
%><%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"
%><%@ taglib prefix="ax" uri="http://axis.com/axu4j"
%><ax:extends name="base">
	<ax:put block="header">
		<h1>Hello AXU4j</h1>
		<p class="desc">axisj default tag</p>
	</ax:put>
	<ax:put block="contents">
		<div class="ax-layer">
			<div class="ax-col-6">
				<div class="ax-unit">
					<div class="ax-box sample-01">
						<div class="ax-box-wrap">
							<ax:button id="btn01" text="button 01" />
							<br/>
							<ax:text id="txt01" placeholder="write text" />
							<br/>
							<ax:number id="num01" value="10" />
							<br/>
							<ax:switch id="swc01" label="AM/FM" />
							<br/>
							<ax:segment id="sgm01" />
							<br/>
						</div>
					</div>
				</div>
			</div>
		</div>
	</ax:put>
	<ax:put block="scripts">
		<script type="text/javascript">
		</script>
	</ax:put>
</ax:extends>